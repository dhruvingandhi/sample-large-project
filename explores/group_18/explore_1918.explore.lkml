# Update for 2000 file diff target
# Explore: explore_1918
# Auto-generated LookML Explore File

include: "/views/domain_05/view_05755.view.lkml"
include: "/views/domain_07/view_05757.view.lkml"
include: "/views/domain_08/view_05758.view.lkml"
include: "/views/domain_09/view_05759.view.lkml"

explore: explore_1918 {
  label: "Explore Explore 1918"
  description: "Comprehensive analytics explore joining base view_05755 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_05755
  
  always_filter: {
    filters: [view_05755.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05755.created_at_date: "7 days"]
    unless: [view_05755.id, view_05755.status]
  }

  join: view_05757 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05755.user_id} = ${view_05757.id} ;;
    required_joins: []
  }

  join: view_05758 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05755.account_id} = ${view_05758.account_id} ;;
    required_joins: [view_05757]
  }

  join: view_05759 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05755.category} = ${view_05759.category} ;;
  }

  access_filter: {
    field: view_05755.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05755.is_deleted} = false ;;
}
