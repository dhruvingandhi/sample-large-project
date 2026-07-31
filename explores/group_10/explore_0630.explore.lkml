# Update for 2000 file diff target
# Explore: explore_0630
# Auto-generated LookML Explore File

include: "/views/domain_41/view_01891.view.lkml"
include: "/views/domain_43/view_01893.view.lkml"
include: "/views/domain_44/view_01894.view.lkml"
include: "/views/domain_45/view_01895.view.lkml"

explore: explore_0630 {
  label: "Explore Explore 0630"
  description: "Comprehensive analytics explore joining base view_01891 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_01891
  
  always_filter: {
    filters: [view_01891.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01891.created_at_date: "7 days"]
    unless: [view_01891.id, view_01891.status]
  }

  join: view_01893 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01891.user_id} = ${view_01893.id} ;;
    required_joins: []
  }

  join: view_01894 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01891.account_id} = ${view_01894.account_id} ;;
    required_joins: [view_01893]
  }

  join: view_01895 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01891.category} = ${view_01895.category} ;;
  }

  access_filter: {
    field: view_01891.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01891.is_deleted} = false ;;
}
