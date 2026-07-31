# Update for 2000 file diff target
# Explore: explore_3777
# Auto-generated LookML Explore File

include: "/views/domain_32/view_11332.view.lkml"
include: "/views/domain_34/view_11334.view.lkml"
include: "/views/domain_35/view_11335.view.lkml"
include: "/views/domain_36/view_11336.view.lkml"

explore: explore_3777 {
  label: "Explore Explore 3777"
  description: "Comprehensive analytics explore joining base view_11332 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_11332
  
  always_filter: {
    filters: [view_11332.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11332.created_at_date: "7 days"]
    unless: [view_11332.id, view_11332.status]
  }

  join: view_11334 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11332.user_id} = ${view_11334.id} ;;
    required_joins: []
  }

  join: view_11335 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11332.account_id} = ${view_11335.account_id} ;;
    required_joins: [view_11334]
  }

  join: view_11336 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11332.category} = ${view_11336.category} ;;
  }

  access_filter: {
    field: view_11332.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11332.is_deleted} = false ;;
}
