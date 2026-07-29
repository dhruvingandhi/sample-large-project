# Explore: explore_1561
# Auto-generated LookML Explore File

include: "/views/domain_34/view_04684.view.lkml"
include: "/views/domain_36/view_04686.view.lkml"
include: "/views/domain_37/view_04687.view.lkml"
include: "/views/domain_38/view_04688.view.lkml"

explore: explore_1561 {
  label: "Explore Explore 1561"
  description: "Comprehensive analytics explore joining base view_04684 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_04684
  
  always_filter: {
    filters: [view_04684.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04684.created_at_date: "7 days"]
    unless: [view_04684.id, view_04684.status]
  }

  join: view_04686 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04684.user_id} = ${view_04686.id} ;;
    required_joins: []
  }

  join: view_04687 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04684.account_id} = ${view_04687.account_id} ;;
    required_joins: [view_04686]
  }

  join: view_04688 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04684.category} = ${view_04688.category} ;;
  }

  access_filter: {
    field: view_04684.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04684.is_deleted} = false ;;
}
