# Explore: explore_1348
# Auto-generated LookML Explore File

include: "/views/domain_45/view_04045.view.lkml"
include: "/views/domain_47/view_04047.view.lkml"
include: "/views/domain_48/view_04048.view.lkml"
include: "/views/domain_49/view_04049.view.lkml"

explore: explore_1348 {
  label: "Explore Explore 1348"
  description: "Comprehensive analytics explore joining base view_04045 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_04045
  
  always_filter: {
    filters: [view_04045.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04045.created_at_date: "7 days"]
    unless: [view_04045.id, view_04045.status]
  }

  join: view_04047 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04045.user_id} = ${view_04047.id} ;;
    required_joins: []
  }

  join: view_04048 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04045.account_id} = ${view_04048.account_id} ;;
    required_joins: [view_04047]
  }

  join: view_04049 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04045.category} = ${view_04049.category} ;;
  }

  access_filter: {
    field: view_04045.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04045.is_deleted} = false ;;
}
