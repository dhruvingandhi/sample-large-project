# Update for 2000 file diff target
# Explore: explore_3498
# Auto-generated LookML Explore File

include: "/views/domain_45/view_10495.view.lkml"
include: "/views/domain_47/view_10497.view.lkml"
include: "/views/domain_48/view_10498.view.lkml"
include: "/views/domain_49/view_10499.view.lkml"

explore: explore_3498 {
  label: "Explore Explore 3498"
  description: "Comprehensive analytics explore joining base view_10495 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_10495
  
  always_filter: {
    filters: [view_10495.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10495.created_at_date: "7 days"]
    unless: [view_10495.id, view_10495.status]
  }

  join: view_10497 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10495.user_id} = ${view_10497.id} ;;
    required_joins: []
  }

  join: view_10498 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10495.account_id} = ${view_10498.account_id} ;;
    required_joins: [view_10497]
  }

  join: view_10499 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10495.category} = ${view_10499.category} ;;
  }

  access_filter: {
    field: view_10495.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10495.is_deleted} = false ;;
}
