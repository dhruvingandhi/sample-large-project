# Update for 2000 file diff target
# Explore: explore_0018
# Auto-generated LookML Explore File

include: "/views/domain_05/view_00055.view.lkml"
include: "/views/domain_07/view_00057.view.lkml"
include: "/views/domain_08/view_00058.view.lkml"
include: "/views/domain_09/view_00059.view.lkml"

explore: explore_0018 {
  label: "Explore Explore 0018"
  description: "Comprehensive analytics explore joining base view_00055 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_00055
  
  always_filter: {
    filters: [view_00055.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00055.created_at_date: "7 days"]
    unless: [view_00055.id, view_00055.status]
  }

  join: view_00057 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00055.user_id} = ${view_00057.id} ;;
    required_joins: []
  }

  join: view_00058 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00055.account_id} = ${view_00058.account_id} ;;
    required_joins: [view_00057]
  }

  join: view_00059 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00055.category} = ${view_00059.category} ;;
  }

  access_filter: {
    field: view_00055.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00055.is_deleted} = false ;;
}
