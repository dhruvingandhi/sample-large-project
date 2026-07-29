# Explore: explore_1234
# Auto-generated LookML Explore File

include: "/views/domain_03/view_03703.view.lkml"
include: "/views/domain_05/view_03705.view.lkml"
include: "/views/domain_06/view_03706.view.lkml"
include: "/views/domain_07/view_03707.view.lkml"

explore: explore_1234 {
  label: "Explore Explore 1234"
  description: "Comprehensive analytics explore joining base view_03703 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_03703
  
  always_filter: {
    filters: [view_03703.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03703.created_at_date: "7 days"]
    unless: [view_03703.id, view_03703.status]
  }

  join: view_03705 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03703.user_id} = ${view_03705.id} ;;
    required_joins: []
  }

  join: view_03706 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03703.account_id} = ${view_03706.account_id} ;;
    required_joins: [view_03705]
  }

  join: view_03707 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03703.category} = ${view_03707.category} ;;
  }

  access_filter: {
    field: view_03703.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03703.is_deleted} = false ;;
}
