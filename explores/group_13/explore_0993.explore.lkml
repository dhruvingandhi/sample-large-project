# Explore: explore_0993
# Auto-generated LookML Explore File

include: "/views/domain_30/view_02980.view.lkml"
include: "/views/domain_32/view_02982.view.lkml"
include: "/views/domain_33/view_02983.view.lkml"
include: "/views/domain_34/view_02984.view.lkml"

explore: explore_0993 {
  label: "Explore Explore 0993"
  description: "Comprehensive analytics explore joining base view_02980 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_02980
  
  always_filter: {
    filters: [view_02980.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02980.created_at_date: "7 days"]
    unless: [view_02980.id, view_02980.status]
  }

  join: view_02982 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02980.user_id} = ${view_02982.id} ;;
    required_joins: []
  }

  join: view_02983 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02980.account_id} = ${view_02983.account_id} ;;
    required_joins: [view_02982]
  }

  join: view_02984 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02980.category} = ${view_02984.category} ;;
  }

  access_filter: {
    field: view_02980.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02980.is_deleted} = false ;;
}
