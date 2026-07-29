# Explore: explore_1201
# Auto-generated LookML Explore File

include: "/views/domain_04/view_03604.view.lkml"
include: "/views/domain_06/view_03606.view.lkml"
include: "/views/domain_07/view_03607.view.lkml"
include: "/views/domain_08/view_03608.view.lkml"

explore: explore_1201 {
  label: "Explore Explore 1201"
  description: "Comprehensive analytics explore joining base view_03604 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_03604
  
  always_filter: {
    filters: [view_03604.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03604.created_at_date: "7 days"]
    unless: [view_03604.id, view_03604.status]
  }

  join: view_03606 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03604.user_id} = ${view_03606.id} ;;
    required_joins: []
  }

  join: view_03607 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03604.account_id} = ${view_03607.account_id} ;;
    required_joins: [view_03606]
  }

  join: view_03608 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03604.category} = ${view_03608.category} ;;
  }

  access_filter: {
    field: view_03604.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03604.is_deleted} = false ;;
}
