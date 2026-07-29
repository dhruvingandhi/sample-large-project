# Explore: explore_0242
# Auto-generated LookML Explore File

include: "/views/domain_27/view_00727.view.lkml"
include: "/views/domain_29/view_00729.view.lkml"
include: "/views/domain_30/view_00730.view.lkml"
include: "/views/domain_31/view_00731.view.lkml"

explore: explore_0242 {
  label: "Explore Explore 0242"
  description: "Comprehensive analytics explore joining base view_00727 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_00727
  
  always_filter: {
    filters: [view_00727.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00727.created_at_date: "7 days"]
    unless: [view_00727.id, view_00727.status]
  }

  join: view_00729 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00727.user_id} = ${view_00729.id} ;;
    required_joins: []
  }

  join: view_00730 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00727.account_id} = ${view_00730.account_id} ;;
    required_joins: [view_00729]
  }

  join: view_00731 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00727.category} = ${view_00731.category} ;;
  }

  access_filter: {
    field: view_00727.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00727.is_deleted} = false ;;
}
