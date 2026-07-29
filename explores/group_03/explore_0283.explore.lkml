# Explore: explore_0283
# Auto-generated LookML Explore File

include: "/views/domain_50/view_00850.view.lkml"
include: "/views/domain_02/view_00852.view.lkml"
include: "/views/domain_03/view_00853.view.lkml"
include: "/views/domain_04/view_00854.view.lkml"

explore: explore_0283 {
  label: "Explore Explore 0283"
  description: "Comprehensive analytics explore joining base view_00850 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_00850
  
  always_filter: {
    filters: [view_00850.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00850.created_at_date: "7 days"]
    unless: [view_00850.id, view_00850.status]
  }

  join: view_00852 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00850.user_id} = ${view_00852.id} ;;
    required_joins: []
  }

  join: view_00853 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00850.account_id} = ${view_00853.account_id} ;;
    required_joins: [view_00852]
  }

  join: view_00854 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00850.category} = ${view_00854.category} ;;
  }

  access_filter: {
    field: view_00850.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00850.is_deleted} = false ;;
}
