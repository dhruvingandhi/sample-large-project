# Explore: explore_2528
# Auto-generated LookML Explore File

include: "/views/domain_35/view_07585.view.lkml"
include: "/views/domain_37/view_07587.view.lkml"
include: "/views/domain_38/view_07588.view.lkml"
include: "/views/domain_39/view_07589.view.lkml"

explore: explore_2528 {
  label: "Explore Explore 2528"
  description: "Comprehensive analytics explore joining base view_07585 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_07585
  
  always_filter: {
    filters: [view_07585.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07585.created_at_date: "7 days"]
    unless: [view_07585.id, view_07585.status]
  }

  join: view_07587 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07585.user_id} = ${view_07587.id} ;;
    required_joins: []
  }

  join: view_07588 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07585.account_id} = ${view_07588.account_id} ;;
    required_joins: [view_07587]
  }

  join: view_07589 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07585.category} = ${view_07589.category} ;;
  }

  access_filter: {
    field: view_07585.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07585.is_deleted} = false ;;
}
