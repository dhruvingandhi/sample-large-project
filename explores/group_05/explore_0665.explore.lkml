# Explore: explore_0665
# Auto-generated LookML Explore File

include: "/views/domain_46/view_01996.view.lkml"
include: "/views/domain_48/view_01998.view.lkml"
include: "/views/domain_49/view_01999.view.lkml"
include: "/views/domain_50/view_02000.view.lkml"

explore: explore_0665 {
  label: "Explore Explore 0665"
  description: "Comprehensive analytics explore joining base view_01996 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_01996
  
  always_filter: {
    filters: [view_01996.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01996.created_at_date: "7 days"]
    unless: [view_01996.id, view_01996.status]
  }

  join: view_01998 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01996.user_id} = ${view_01998.id} ;;
    required_joins: []
  }

  join: view_01999 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01996.account_id} = ${view_01999.account_id} ;;
    required_joins: [view_01998]
  }

  join: view_02000 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01996.category} = ${view_02000.category} ;;
  }

  access_filter: {
    field: view_01996.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01996.is_deleted} = false ;;
}
