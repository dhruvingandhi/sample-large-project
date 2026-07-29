# Explore: explore_2720
# Auto-generated LookML Explore File

include: "/views/domain_11/view_08161.view.lkml"
include: "/views/domain_13/view_08163.view.lkml"
include: "/views/domain_14/view_08164.view.lkml"
include: "/views/domain_15/view_08165.view.lkml"

explore: explore_2720 {
  label: "Explore Explore 2720"
  description: "Comprehensive analytics explore joining base view_08161 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_08161
  
  always_filter: {
    filters: [view_08161.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08161.created_at_date: "7 days"]
    unless: [view_08161.id, view_08161.status]
  }

  join: view_08163 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08161.user_id} = ${view_08163.id} ;;
    required_joins: []
  }

  join: view_08164 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08161.account_id} = ${view_08164.account_id} ;;
    required_joins: [view_08163]
  }

  join: view_08165 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08161.category} = ${view_08165.category} ;;
  }

  access_filter: {
    field: view_08161.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08161.is_deleted} = false ;;
}
