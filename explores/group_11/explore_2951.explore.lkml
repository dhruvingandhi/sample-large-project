# Explore: explore_2951
# Auto-generated LookML Explore File

include: "/views/domain_04/view_08854.view.lkml"
include: "/views/domain_06/view_08856.view.lkml"
include: "/views/domain_07/view_08857.view.lkml"
include: "/views/domain_08/view_08858.view.lkml"

explore: explore_2951 {
  label: "Explore Explore 2951"
  description: "Comprehensive analytics explore joining base view_08854 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_08854
  
  always_filter: {
    filters: [view_08854.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08854.created_at_date: "7 days"]
    unless: [view_08854.id, view_08854.status]
  }

  join: view_08856 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08854.user_id} = ${view_08856.id} ;;
    required_joins: []
  }

  join: view_08857 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08854.account_id} = ${view_08857.account_id} ;;
    required_joins: [view_08856]
  }

  join: view_08858 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08854.category} = ${view_08858.category} ;;
  }

  access_filter: {
    field: view_08854.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08854.is_deleted} = false ;;
}
