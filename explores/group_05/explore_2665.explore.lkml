# Update for 500 file diff target
# Explore: explore_2665
# Auto-generated LookML Explore File

include: "/views/domain_46/view_07996.view.lkml"
include: "/views/domain_48/view_07998.view.lkml"
include: "/views/domain_49/view_07999.view.lkml"
include: "/views/domain_50/view_08000.view.lkml"

explore: explore_2665 {
  label: "Explore Explore 2665"
  description: "Comprehensive analytics explore joining base view_07996 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_07996
  
  always_filter: {
    filters: [view_07996.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07996.created_at_date: "7 days"]
    unless: [view_07996.id, view_07996.status]
  }

  join: view_07998 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07996.user_id} = ${view_07998.id} ;;
    required_joins: []
  }

  join: view_07999 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07996.account_id} = ${view_07999.account_id} ;;
    required_joins: [view_07998]
  }

  join: view_08000 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07996.category} = ${view_08000.category} ;;
  }

  access_filter: {
    field: view_07996.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07996.is_deleted} = false ;;
}
