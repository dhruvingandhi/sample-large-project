# Explore: explore_0333
# Auto-generated LookML Explore File

include: "/views/domain_50/view_01000.view.lkml"
include: "/views/domain_02/view_01002.view.lkml"
include: "/views/domain_03/view_01003.view.lkml"
include: "/views/domain_04/view_01004.view.lkml"

explore: explore_0333 {
  label: "Explore Explore 0333"
  description: "Comprehensive analytics explore joining base view_01000 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_01000
  
  always_filter: {
    filters: [view_01000.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01000.created_at_date: "7 days"]
    unless: [view_01000.id, view_01000.status]
  }

  join: view_01002 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01000.user_id} = ${view_01002.id} ;;
    required_joins: []
  }

  join: view_01003 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01000.account_id} = ${view_01003.account_id} ;;
    required_joins: [view_01002]
  }

  join: view_01004 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01000.category} = ${view_01004.category} ;;
  }

  access_filter: {
    field: view_01000.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01000.is_deleted} = false ;;
}
