# Explore: explore_1999
# Auto-generated LookML Explore File

include: "/views/domain_48/view_05998.view.lkml"
include: "/views/domain_50/view_06000.view.lkml"
include: "/views/domain_01/view_06001.view.lkml"
include: "/views/domain_02/view_06002.view.lkml"

explore: explore_1999 {
  label: "Explore Explore 1999"
  description: "Comprehensive analytics explore joining base view_05998 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_05998
  
  always_filter: {
    filters: [view_05998.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05998.created_at_date: "7 days"]
    unless: [view_05998.id, view_05998.status]
  }

  join: view_06000 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05998.user_id} = ${view_06000.id} ;;
    required_joins: []
  }

  join: view_06001 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05998.account_id} = ${view_06001.account_id} ;;
    required_joins: [view_06000]
  }

  join: view_06002 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05998.category} = ${view_06002.category} ;;
  }

  access_filter: {
    field: view_05998.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05998.is_deleted} = false ;;
}
