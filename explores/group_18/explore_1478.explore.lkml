# Explore: explore_1478
# Auto-generated LookML Explore File

include: "/views/domain_35/view_04435.view.lkml"
include: "/views/domain_37/view_04437.view.lkml"
include: "/views/domain_38/view_04438.view.lkml"
include: "/views/domain_39/view_04439.view.lkml"

explore: explore_1478 {
  label: "Explore Explore 1478"
  description: "Comprehensive analytics explore joining base view_04435 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_04435
  
  always_filter: {
    filters: [view_04435.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04435.created_at_date: "7 days"]
    unless: [view_04435.id, view_04435.status]
  }

  join: view_04437 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04435.user_id} = ${view_04437.id} ;;
    required_joins: []
  }

  join: view_04438 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04435.account_id} = ${view_04438.account_id} ;;
    required_joins: [view_04437]
  }

  join: view_04439 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04435.category} = ${view_04439.category} ;;
  }

  access_filter: {
    field: view_04435.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04435.is_deleted} = false ;;
}
