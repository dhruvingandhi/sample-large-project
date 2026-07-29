# Explore: explore_1664
# Auto-generated LookML Explore File

include: "/views/domain_43/view_04993.view.lkml"
include: "/views/domain_45/view_04995.view.lkml"
include: "/views/domain_46/view_04996.view.lkml"
include: "/views/domain_47/view_04997.view.lkml"

explore: explore_1664 {
  label: "Explore Explore 1664"
  description: "Comprehensive analytics explore joining base view_04993 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_04993
  
  always_filter: {
    filters: [view_04993.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04993.created_at_date: "7 days"]
    unless: [view_04993.id, view_04993.status]
  }

  join: view_04995 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04993.user_id} = ${view_04995.id} ;;
    required_joins: []
  }

  join: view_04996 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04993.account_id} = ${view_04996.account_id} ;;
    required_joins: [view_04995]
  }

  join: view_04997 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04993.category} = ${view_04997.category} ;;
  }

  access_filter: {
    field: view_04993.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04993.is_deleted} = false ;;
}
