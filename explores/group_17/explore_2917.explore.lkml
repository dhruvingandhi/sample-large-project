# Explore: explore_2917
# Auto-generated LookML Explore File

include: "/views/domain_02/view_08752.view.lkml"
include: "/views/domain_04/view_08754.view.lkml"
include: "/views/domain_05/view_08755.view.lkml"
include: "/views/domain_06/view_08756.view.lkml"

explore: explore_2917 {
  label: "Explore Explore 2917"
  description: "Comprehensive analytics explore joining base view_08752 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_08752
  
  always_filter: {
    filters: [view_08752.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08752.created_at_date: "7 days"]
    unless: [view_08752.id, view_08752.status]
  }

  join: view_08754 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08752.user_id} = ${view_08754.id} ;;
    required_joins: []
  }

  join: view_08755 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08752.account_id} = ${view_08755.account_id} ;;
    required_joins: [view_08754]
  }

  join: view_08756 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08752.category} = ${view_08756.category} ;;
  }

  access_filter: {
    field: view_08752.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08752.is_deleted} = false ;;
}
