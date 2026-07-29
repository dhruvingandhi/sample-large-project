# Explore: explore_0181
# Auto-generated LookML Explore File

include: "/views/domain_44/view_00544.view.lkml"
include: "/views/domain_46/view_00546.view.lkml"
include: "/views/domain_47/view_00547.view.lkml"
include: "/views/domain_48/view_00548.view.lkml"

explore: explore_0181 {
  label: "Explore Explore 0181"
  description: "Comprehensive analytics explore joining base view_00544 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_00544
  
  always_filter: {
    filters: [view_00544.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00544.created_at_date: "7 days"]
    unless: [view_00544.id, view_00544.status]
  }

  join: view_00546 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00544.user_id} = ${view_00546.id} ;;
    required_joins: []
  }

  join: view_00547 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00544.account_id} = ${view_00547.account_id} ;;
    required_joins: [view_00546]
  }

  join: view_00548 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00544.category} = ${view_00548.category} ;;
  }

  access_filter: {
    field: view_00544.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00544.is_deleted} = false ;;
}
