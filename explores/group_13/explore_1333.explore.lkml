# Explore: explore_1333
# Auto-generated LookML Explore File

include: "/views/domain_50/view_04000.view.lkml"
include: "/views/domain_02/view_04002.view.lkml"
include: "/views/domain_03/view_04003.view.lkml"
include: "/views/domain_04/view_04004.view.lkml"

explore: explore_1333 {
  label: "Explore Explore 1333"
  description: "Comprehensive analytics explore joining base view_04000 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_04000
  
  always_filter: {
    filters: [view_04000.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04000.created_at_date: "7 days"]
    unless: [view_04000.id, view_04000.status]
  }

  join: view_04002 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04000.user_id} = ${view_04002.id} ;;
    required_joins: []
  }

  join: view_04003 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04000.account_id} = ${view_04003.account_id} ;;
    required_joins: [view_04002]
  }

  join: view_04004 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04000.category} = ${view_04004.category} ;;
  }

  access_filter: {
    field: view_04000.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04000.is_deleted} = false ;;
}
