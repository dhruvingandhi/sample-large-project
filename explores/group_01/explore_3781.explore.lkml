# Explore: explore_3781
# Auto-generated LookML Explore File

include: "/views/domain_44/view_11344.view.lkml"
include: "/views/domain_46/view_11346.view.lkml"
include: "/views/domain_47/view_11347.view.lkml"
include: "/views/domain_48/view_11348.view.lkml"

explore: explore_3781 {
  label: "Explore Explore 3781"
  description: "Comprehensive analytics explore joining base view_11344 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_11344
  
  always_filter: {
    filters: [view_11344.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11344.created_at_date: "7 days"]
    unless: [view_11344.id, view_11344.status]
  }

  join: view_11346 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11344.user_id} = ${view_11346.id} ;;
    required_joins: []
  }

  join: view_11347 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11344.account_id} = ${view_11347.account_id} ;;
    required_joins: [view_11346]
  }

  join: view_11348 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11344.category} = ${view_11348.category} ;;
  }

  access_filter: {
    field: view_11344.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11344.is_deleted} = false ;;
}
