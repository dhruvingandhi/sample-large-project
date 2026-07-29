# Explore: explore_3099
# Auto-generated LookML Explore File

include: "/views/domain_48/view_09298.view.lkml"
include: "/views/domain_50/view_09300.view.lkml"
include: "/views/domain_01/view_09301.view.lkml"
include: "/views/domain_02/view_09302.view.lkml"

explore: explore_3099 {
  label: "Explore Explore 3099"
  description: "Comprehensive analytics explore joining base view_09298 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_09298
  
  always_filter: {
    filters: [view_09298.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09298.created_at_date: "7 days"]
    unless: [view_09298.id, view_09298.status]
  }

  join: view_09300 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09298.user_id} = ${view_09300.id} ;;
    required_joins: []
  }

  join: view_09301 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09298.account_id} = ${view_09301.account_id} ;;
    required_joins: [view_09300]
  }

  join: view_09302 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09298.category} = ${view_09302.category} ;;
  }

  access_filter: {
    field: view_09298.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09298.is_deleted} = false ;;
}
