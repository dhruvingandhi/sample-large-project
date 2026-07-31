# Update for 2000 file diff target
# Explore: explore_2498
# Auto-generated LookML Explore File

include: "/views/domain_45/view_07495.view.lkml"
include: "/views/domain_47/view_07497.view.lkml"
include: "/views/domain_48/view_07498.view.lkml"
include: "/views/domain_49/view_07499.view.lkml"

explore: explore_2498 {
  label: "Explore Explore 2498"
  description: "Comprehensive analytics explore joining base view_07495 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_07495
  
  always_filter: {
    filters: [view_07495.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07495.created_at_date: "7 days"]
    unless: [view_07495.id, view_07495.status]
  }

  join: view_07497 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07495.user_id} = ${view_07497.id} ;;
    required_joins: []
  }

  join: view_07498 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07495.account_id} = ${view_07498.account_id} ;;
    required_joins: [view_07497]
  }

  join: view_07499 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07495.category} = ${view_07499.category} ;;
  }

  access_filter: {
    field: view_07495.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07495.is_deleted} = false ;;
}
