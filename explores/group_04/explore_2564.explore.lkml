# Explore: explore_2564
# Auto-generated LookML Explore File

include: "/views/domain_43/view_07693.view.lkml"
include: "/views/domain_45/view_07695.view.lkml"
include: "/views/domain_46/view_07696.view.lkml"
include: "/views/domain_47/view_07697.view.lkml"

explore: explore_2564 {
  label: "Explore Explore 2564"
  description: "Comprehensive analytics explore joining base view_07693 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_07693
  
  always_filter: {
    filters: [view_07693.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07693.created_at_date: "7 days"]
    unless: [view_07693.id, view_07693.status]
  }

  join: view_07695 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07693.user_id} = ${view_07695.id} ;;
    required_joins: []
  }

  join: view_07696 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07693.account_id} = ${view_07696.account_id} ;;
    required_joins: [view_07695]
  }

  join: view_07697 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07693.category} = ${view_07697.category} ;;
  }

  access_filter: {
    field: view_07693.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07693.is_deleted} = false ;;
}
