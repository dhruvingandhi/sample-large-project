# Explore: explore_0299
# Auto-generated LookML Explore File

include: "/views/domain_48/view_00898.view.lkml"
include: "/views/domain_50/view_00900.view.lkml"
include: "/views/domain_01/view_00901.view.lkml"
include: "/views/domain_02/view_00902.view.lkml"

explore: explore_0299 {
  label: "Explore Explore 0299"
  description: "Comprehensive analytics explore joining base view_00898 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_00898
  
  always_filter: {
    filters: [view_00898.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00898.created_at_date: "7 days"]
    unless: [view_00898.id, view_00898.status]
  }

  join: view_00900 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00898.user_id} = ${view_00900.id} ;;
    required_joins: []
  }

  join: view_00901 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00898.account_id} = ${view_00901.account_id} ;;
    required_joins: [view_00900]
  }

  join: view_00902 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00898.category} = ${view_00902.category} ;;
  }

  access_filter: {
    field: view_00898.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00898.is_deleted} = false ;;
}
