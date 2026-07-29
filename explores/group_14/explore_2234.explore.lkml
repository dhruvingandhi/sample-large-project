# Explore: explore_2234
# Auto-generated LookML Explore File

include: "/views/domain_03/view_06703.view.lkml"
include: "/views/domain_05/view_06705.view.lkml"
include: "/views/domain_06/view_06706.view.lkml"
include: "/views/domain_07/view_06707.view.lkml"

explore: explore_2234 {
  label: "Explore Explore 2234"
  description: "Comprehensive analytics explore joining base view_06703 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_06703
  
  always_filter: {
    filters: [view_06703.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06703.created_at_date: "7 days"]
    unless: [view_06703.id, view_06703.status]
  }

  join: view_06705 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06703.user_id} = ${view_06705.id} ;;
    required_joins: []
  }

  join: view_06706 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06703.account_id} = ${view_06706.account_id} ;;
    required_joins: [view_06705]
  }

  join: view_06707 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06703.category} = ${view_06707.category} ;;
  }

  access_filter: {
    field: view_06703.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06703.is_deleted} = false ;;
}
