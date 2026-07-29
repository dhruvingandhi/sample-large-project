# Explore: explore_0918
# Auto-generated LookML Explore File

include: "/views/domain_05/view_02755.view.lkml"
include: "/views/domain_07/view_02757.view.lkml"
include: "/views/domain_08/view_02758.view.lkml"
include: "/views/domain_09/view_02759.view.lkml"

explore: explore_0918 {
  label: "Explore Explore 0918"
  description: "Comprehensive analytics explore joining base view_02755 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_02755
  
  always_filter: {
    filters: [view_02755.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02755.created_at_date: "7 days"]
    unless: [view_02755.id, view_02755.status]
  }

  join: view_02757 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02755.user_id} = ${view_02757.id} ;;
    required_joins: []
  }

  join: view_02758 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02755.account_id} = ${view_02758.account_id} ;;
    required_joins: [view_02757]
  }

  join: view_02759 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02755.category} = ${view_02759.category} ;;
  }

  access_filter: {
    field: view_02755.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02755.is_deleted} = false ;;
}
