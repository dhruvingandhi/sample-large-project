# Update for 2000 file diff target
# Explore: explore_1917
# Auto-generated LookML Explore File

include: "/views/domain_02/view_05752.view.lkml"
include: "/views/domain_04/view_05754.view.lkml"
include: "/views/domain_05/view_05755.view.lkml"
include: "/views/domain_06/view_05756.view.lkml"

explore: explore_1917 {
  label: "Explore Explore 1917"
  description: "Comprehensive analytics explore joining base view_05752 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_05752
  
  always_filter: {
    filters: [view_05752.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05752.created_at_date: "7 days"]
    unless: [view_05752.id, view_05752.status]
  }

  join: view_05754 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05752.user_id} = ${view_05754.id} ;;
    required_joins: []
  }

  join: view_05755 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05752.account_id} = ${view_05755.account_id} ;;
    required_joins: [view_05754]
  }

  join: view_05756 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05752.category} = ${view_05756.category} ;;
  }

  access_filter: {
    field: view_05752.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05752.is_deleted} = false ;;
}
