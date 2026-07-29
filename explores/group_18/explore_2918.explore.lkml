# Explore: explore_2918
# Auto-generated LookML Explore File

include: "/views/domain_05/view_08755.view.lkml"
include: "/views/domain_07/view_08757.view.lkml"
include: "/views/domain_08/view_08758.view.lkml"
include: "/views/domain_09/view_08759.view.lkml"

explore: explore_2918 {
  label: "Explore Explore 2918"
  description: "Comprehensive analytics explore joining base view_08755 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_08755
  
  always_filter: {
    filters: [view_08755.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08755.created_at_date: "7 days"]
    unless: [view_08755.id, view_08755.status]
  }

  join: view_08757 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08755.user_id} = ${view_08757.id} ;;
    required_joins: []
  }

  join: view_08758 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08755.account_id} = ${view_08758.account_id} ;;
    required_joins: [view_08757]
  }

  join: view_08759 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08755.category} = ${view_08759.category} ;;
  }

  access_filter: {
    field: view_08755.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08755.is_deleted} = false ;;
}
