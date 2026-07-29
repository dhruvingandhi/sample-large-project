# Explore: explore_2386
# Auto-generated LookML Explore File

include: "/views/domain_09/view_07159.view.lkml"
include: "/views/domain_11/view_07161.view.lkml"
include: "/views/domain_12/view_07162.view.lkml"
include: "/views/domain_13/view_07163.view.lkml"

explore: explore_2386 {
  label: "Explore Explore 2386"
  description: "Comprehensive analytics explore joining base view_07159 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_07159
  
  always_filter: {
    filters: [view_07159.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07159.created_at_date: "7 days"]
    unless: [view_07159.id, view_07159.status]
  }

  join: view_07161 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07159.user_id} = ${view_07161.id} ;;
    required_joins: []
  }

  join: view_07162 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07159.account_id} = ${view_07162.account_id} ;;
    required_joins: [view_07161]
  }

  join: view_07163 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07159.category} = ${view_07163.category} ;;
  }

  access_filter: {
    field: view_07159.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07159.is_deleted} = false ;;
}
