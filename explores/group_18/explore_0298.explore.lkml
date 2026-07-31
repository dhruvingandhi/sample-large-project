# Update for 2000 file diff target
# Explore: explore_0298
# Auto-generated LookML Explore File

include: "/views/domain_45/view_00895.view.lkml"
include: "/views/domain_47/view_00897.view.lkml"
include: "/views/domain_48/view_00898.view.lkml"
include: "/views/domain_49/view_00899.view.lkml"

explore: explore_0298 {
  label: "Explore Explore 0298"
  description: "Comprehensive analytics explore joining base view_00895 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_00895
  
  always_filter: {
    filters: [view_00895.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00895.created_at_date: "7 days"]
    unless: [view_00895.id, view_00895.status]
  }

  join: view_00897 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00895.user_id} = ${view_00897.id} ;;
    required_joins: []
  }

  join: view_00898 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00895.account_id} = ${view_00898.account_id} ;;
    required_joins: [view_00897]
  }

  join: view_00899 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00895.category} = ${view_00899.category} ;;
  }

  access_filter: {
    field: view_00895.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00895.is_deleted} = false ;;
}
