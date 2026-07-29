# Explore: explore_3948
# Auto-generated LookML Explore File

include: "/views/domain_45/view_11845.view.lkml"
include: "/views/domain_47/view_11847.view.lkml"
include: "/views/domain_48/view_11848.view.lkml"
include: "/views/domain_49/view_11849.view.lkml"

explore: explore_3948 {
  label: "Explore Explore 3948"
  description: "Comprehensive analytics explore joining base view_11845 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_11845
  
  always_filter: {
    filters: [view_11845.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11845.created_at_date: "7 days"]
    unless: [view_11845.id, view_11845.status]
  }

  join: view_11847 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11845.user_id} = ${view_11847.id} ;;
    required_joins: []
  }

  join: view_11848 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11845.account_id} = ${view_11848.account_id} ;;
    required_joins: [view_11847]
  }

  join: view_11849 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11845.category} = ${view_11849.category} ;;
  }

  access_filter: {
    field: view_11845.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11845.is_deleted} = false ;;
}
