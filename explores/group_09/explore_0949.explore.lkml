# Explore: explore_0949
# Auto-generated LookML Explore File

include: "/views/domain_48/view_02848.view.lkml"
include: "/views/domain_50/view_02850.view.lkml"
include: "/views/domain_01/view_02851.view.lkml"
include: "/views/domain_02/view_02852.view.lkml"

explore: explore_0949 {
  label: "Explore Explore 0949"
  description: "Comprehensive analytics explore joining base view_02848 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_02848
  
  always_filter: {
    filters: [view_02848.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02848.created_at_date: "7 days"]
    unless: [view_02848.id, view_02848.status]
  }

  join: view_02850 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02848.user_id} = ${view_02850.id} ;;
    required_joins: []
  }

  join: view_02851 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02848.account_id} = ${view_02851.account_id} ;;
    required_joins: [view_02850]
  }

  join: view_02852 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02848.category} = ${view_02852.category} ;;
  }

  access_filter: {
    field: view_02848.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02848.is_deleted} = false ;;
}
