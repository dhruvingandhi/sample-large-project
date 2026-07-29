# Explore: explore_2596
# Auto-generated LookML Explore File

include: "/views/domain_39/view_07789.view.lkml"
include: "/views/domain_41/view_07791.view.lkml"
include: "/views/domain_42/view_07792.view.lkml"
include: "/views/domain_43/view_07793.view.lkml"

explore: explore_2596 {
  label: "Explore Explore 2596"
  description: "Comprehensive analytics explore joining base view_07789 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_07789
  
  always_filter: {
    filters: [view_07789.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07789.created_at_date: "7 days"]
    unless: [view_07789.id, view_07789.status]
  }

  join: view_07791 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07789.user_id} = ${view_07791.id} ;;
    required_joins: []
  }

  join: view_07792 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07789.account_id} = ${view_07792.account_id} ;;
    required_joins: [view_07791]
  }

  join: view_07793 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07789.category} = ${view_07793.category} ;;
  }

  access_filter: {
    field: view_07789.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07789.is_deleted} = false ;;
}
