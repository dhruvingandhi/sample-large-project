# Explore: explore_1528
# Auto-generated LookML Explore File

include: "/views/domain_35/view_04585.view.lkml"
include: "/views/domain_37/view_04587.view.lkml"
include: "/views/domain_38/view_04588.view.lkml"
include: "/views/domain_39/view_04589.view.lkml"

explore: explore_1528 {
  label: "Explore Explore 1528"
  description: "Comprehensive analytics explore joining base view_04585 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_04585
  
  always_filter: {
    filters: [view_04585.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04585.created_at_date: "7 days"]
    unless: [view_04585.id, view_04585.status]
  }

  join: view_04587 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04585.user_id} = ${view_04587.id} ;;
    required_joins: []
  }

  join: view_04588 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04585.account_id} = ${view_04588.account_id} ;;
    required_joins: [view_04587]
  }

  join: view_04589 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04585.category} = ${view_04589.category} ;;
  }

  access_filter: {
    field: view_04585.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04585.is_deleted} = false ;;
}
