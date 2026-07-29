# Explore: explore_1969
# Auto-generated LookML Explore File

include: "/views/domain_08/view_05908.view.lkml"
include: "/views/domain_10/view_05910.view.lkml"
include: "/views/domain_11/view_05911.view.lkml"
include: "/views/domain_12/view_05912.view.lkml"

explore: explore_1969 {
  label: "Explore Explore 1969"
  description: "Comprehensive analytics explore joining base view_05908 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_05908
  
  always_filter: {
    filters: [view_05908.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05908.created_at_date: "7 days"]
    unless: [view_05908.id, view_05908.status]
  }

  join: view_05910 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05908.user_id} = ${view_05910.id} ;;
    required_joins: []
  }

  join: view_05911 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05908.account_id} = ${view_05911.account_id} ;;
    required_joins: [view_05910]
  }

  join: view_05912 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05908.category} = ${view_05912.category} ;;
  }

  access_filter: {
    field: view_05908.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05908.is_deleted} = false ;;
}
