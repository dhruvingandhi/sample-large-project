# Explore: explore_1650
# Auto-generated LookML Explore File

include: "/views/domain_01/view_04951.view.lkml"
include: "/views/domain_03/view_04953.view.lkml"
include: "/views/domain_04/view_04954.view.lkml"
include: "/views/domain_05/view_04955.view.lkml"

explore: explore_1650 {
  label: "Explore Explore 1650"
  description: "Comprehensive analytics explore joining base view_04951 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_04951
  
  always_filter: {
    filters: [view_04951.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04951.created_at_date: "7 days"]
    unless: [view_04951.id, view_04951.status]
  }

  join: view_04953 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04951.user_id} = ${view_04953.id} ;;
    required_joins: []
  }

  join: view_04954 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04951.account_id} = ${view_04954.account_id} ;;
    required_joins: [view_04953]
  }

  join: view_04955 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04951.category} = ${view_04955.category} ;;
  }

  access_filter: {
    field: view_04951.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04951.is_deleted} = false ;;
}
