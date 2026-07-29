# Explore: explore_2950
# Auto-generated LookML Explore File

include: "/views/domain_01/view_08851.view.lkml"
include: "/views/domain_03/view_08853.view.lkml"
include: "/views/domain_04/view_08854.view.lkml"
include: "/views/domain_05/view_08855.view.lkml"

explore: explore_2950 {
  label: "Explore Explore 2950"
  description: "Comprehensive analytics explore joining base view_08851 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_08851
  
  always_filter: {
    filters: [view_08851.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08851.created_at_date: "7 days"]
    unless: [view_08851.id, view_08851.status]
  }

  join: view_08853 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08851.user_id} = ${view_08853.id} ;;
    required_joins: []
  }

  join: view_08854 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08851.account_id} = ${view_08854.account_id} ;;
    required_joins: [view_08853]
  }

  join: view_08855 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08851.category} = ${view_08855.category} ;;
  }

  access_filter: {
    field: view_08851.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08851.is_deleted} = false ;;
}
