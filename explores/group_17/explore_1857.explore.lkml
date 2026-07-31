# Update for 2000 file diff target
# Explore: explore_1857
# Auto-generated LookML Explore File

include: "/views/domain_22/view_05572.view.lkml"
include: "/views/domain_24/view_05574.view.lkml"
include: "/views/domain_25/view_05575.view.lkml"
include: "/views/domain_26/view_05576.view.lkml"

explore: explore_1857 {
  label: "Explore Explore 1857"
  description: "Comprehensive analytics explore joining base view_05572 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_05572
  
  always_filter: {
    filters: [view_05572.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05572.created_at_date: "7 days"]
    unless: [view_05572.id, view_05572.status]
  }

  join: view_05574 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05572.user_id} = ${view_05574.id} ;;
    required_joins: []
  }

  join: view_05575 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05572.account_id} = ${view_05575.account_id} ;;
    required_joins: [view_05574]
  }

  join: view_05576 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05572.category} = ${view_05576.category} ;;
  }

  access_filter: {
    field: view_05572.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05572.is_deleted} = false ;;
}
