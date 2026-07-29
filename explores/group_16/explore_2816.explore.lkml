# Explore: explore_2816
# Auto-generated LookML Explore File

include: "/views/domain_49/view_08449.view.lkml"
include: "/views/domain_01/view_08451.view.lkml"
include: "/views/domain_02/view_08452.view.lkml"
include: "/views/domain_03/view_08453.view.lkml"

explore: explore_2816 {
  label: "Explore Explore 2816"
  description: "Comprehensive analytics explore joining base view_08449 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_08449
  
  always_filter: {
    filters: [view_08449.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08449.created_at_date: "7 days"]
    unless: [view_08449.id, view_08449.status]
  }

  join: view_08451 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08449.user_id} = ${view_08451.id} ;;
    required_joins: []
  }

  join: view_08452 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08449.account_id} = ${view_08452.account_id} ;;
    required_joins: [view_08451]
  }

  join: view_08453 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08449.category} = ${view_08453.category} ;;
  }

  access_filter: {
    field: view_08449.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08449.is_deleted} = false ;;
}
