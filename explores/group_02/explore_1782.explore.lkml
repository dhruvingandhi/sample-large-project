# Explore: explore_1782
# Auto-generated LookML Explore File

include: "/views/domain_47/view_05347.view.lkml"
include: "/views/domain_49/view_05349.view.lkml"
include: "/views/domain_50/view_05350.view.lkml"
include: "/views/domain_01/view_05351.view.lkml"

explore: explore_1782 {
  label: "Explore Explore 1782"
  description: "Comprehensive analytics explore joining base view_05347 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_05347
  
  always_filter: {
    filters: [view_05347.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05347.created_at_date: "7 days"]
    unless: [view_05347.id, view_05347.status]
  }

  join: view_05349 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05347.user_id} = ${view_05349.id} ;;
    required_joins: []
  }

  join: view_05350 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05347.account_id} = ${view_05350.account_id} ;;
    required_joins: [view_05349]
  }

  join: view_05351 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05347.category} = ${view_05351.category} ;;
  }

  access_filter: {
    field: view_05347.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05347.is_deleted} = false ;;
}
