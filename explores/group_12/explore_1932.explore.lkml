# Explore: explore_1932
# Auto-generated LookML Explore File

include: "/views/domain_47/view_05797.view.lkml"
include: "/views/domain_49/view_05799.view.lkml"
include: "/views/domain_50/view_05800.view.lkml"
include: "/views/domain_01/view_05801.view.lkml"

explore: explore_1932 {
  label: "Explore Explore 1932"
  description: "Comprehensive analytics explore joining base view_05797 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_05797
  
  always_filter: {
    filters: [view_05797.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05797.created_at_date: "7 days"]
    unless: [view_05797.id, view_05797.status]
  }

  join: view_05799 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05797.user_id} = ${view_05799.id} ;;
    required_joins: []
  }

  join: view_05800 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05797.account_id} = ${view_05800.account_id} ;;
    required_joins: [view_05799]
  }

  join: view_05801 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05797.category} = ${view_05801.category} ;;
  }

  access_filter: {
    field: view_05797.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05797.is_deleted} = false ;;
}
