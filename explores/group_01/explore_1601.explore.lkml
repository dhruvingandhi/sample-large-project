# Explore: explore_1601
# Auto-generated LookML Explore File

include: "/views/domain_04/view_04804.view.lkml"
include: "/views/domain_06/view_04806.view.lkml"
include: "/views/domain_07/view_04807.view.lkml"
include: "/views/domain_08/view_04808.view.lkml"

explore: explore_1601 {
  label: "Explore Explore 1601"
  description: "Comprehensive analytics explore joining base view_04804 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_04804
  
  always_filter: {
    filters: [view_04804.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04804.created_at_date: "7 days"]
    unless: [view_04804.id, view_04804.status]
  }

  join: view_04806 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04804.user_id} = ${view_04806.id} ;;
    required_joins: []
  }

  join: view_04807 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04804.account_id} = ${view_04807.account_id} ;;
    required_joins: [view_04806]
  }

  join: view_04808 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04804.category} = ${view_04808.category} ;;
  }

  access_filter: {
    field: view_04804.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04804.is_deleted} = false ;;
}
