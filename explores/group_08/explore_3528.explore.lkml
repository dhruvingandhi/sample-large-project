# Explore: explore_3528
# Auto-generated LookML Explore File

include: "/views/domain_35/view_10585.view.lkml"
include: "/views/domain_37/view_10587.view.lkml"
include: "/views/domain_38/view_10588.view.lkml"
include: "/views/domain_39/view_10589.view.lkml"

explore: explore_3528 {
  label: "Explore Explore 3528"
  description: "Comprehensive analytics explore joining base view_10585 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_10585
  
  always_filter: {
    filters: [view_10585.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10585.created_at_date: "7 days"]
    unless: [view_10585.id, view_10585.status]
  }

  join: view_10587 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10585.user_id} = ${view_10587.id} ;;
    required_joins: []
  }

  join: view_10588 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10585.account_id} = ${view_10588.account_id} ;;
    required_joins: [view_10587]
  }

  join: view_10589 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10585.category} = ${view_10589.category} ;;
  }

  access_filter: {
    field: view_10585.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10585.is_deleted} = false ;;
}
