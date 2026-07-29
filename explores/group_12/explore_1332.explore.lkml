# Explore: explore_1332
# Auto-generated LookML Explore File

include: "/views/domain_47/view_03997.view.lkml"
include: "/views/domain_49/view_03999.view.lkml"
include: "/views/domain_50/view_04000.view.lkml"
include: "/views/domain_01/view_04001.view.lkml"

explore: explore_1332 {
  label: "Explore Explore 1332"
  description: "Comprehensive analytics explore joining base view_03997 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_03997
  
  always_filter: {
    filters: [view_03997.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03997.created_at_date: "7 days"]
    unless: [view_03997.id, view_03997.status]
  }

  join: view_03999 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03997.user_id} = ${view_03999.id} ;;
    required_joins: []
  }

  join: view_04000 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03997.account_id} = ${view_04000.account_id} ;;
    required_joins: [view_03999]
  }

  join: view_04001 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03997.category} = ${view_04001.category} ;;
  }

  access_filter: {
    field: view_03997.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03997.is_deleted} = false ;;
}
