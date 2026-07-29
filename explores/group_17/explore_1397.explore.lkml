# Explore: explore_1397
# Auto-generated LookML Explore File

include: "/views/domain_42/view_04192.view.lkml"
include: "/views/domain_44/view_04194.view.lkml"
include: "/views/domain_45/view_04195.view.lkml"
include: "/views/domain_46/view_04196.view.lkml"

explore: explore_1397 {
  label: "Explore Explore 1397"
  description: "Comprehensive analytics explore joining base view_04192 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_04192
  
  always_filter: {
    filters: [view_04192.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04192.created_at_date: "7 days"]
    unless: [view_04192.id, view_04192.status]
  }

  join: view_04194 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04192.user_id} = ${view_04194.id} ;;
    required_joins: []
  }

  join: view_04195 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04192.account_id} = ${view_04195.account_id} ;;
    required_joins: [view_04194]
  }

  join: view_04196 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04192.category} = ${view_04196.category} ;;
  }

  access_filter: {
    field: view_04192.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04192.is_deleted} = false ;;
}
