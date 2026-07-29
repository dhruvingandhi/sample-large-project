# Explore: explore_1881
# Auto-generated LookML Explore File

include: "/views/domain_44/view_05644.view.lkml"
include: "/views/domain_46/view_05646.view.lkml"
include: "/views/domain_47/view_05647.view.lkml"
include: "/views/domain_48/view_05648.view.lkml"

explore: explore_1881 {
  label: "Explore Explore 1881"
  description: "Comprehensive analytics explore joining base view_05644 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_05644
  
  always_filter: {
    filters: [view_05644.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05644.created_at_date: "7 days"]
    unless: [view_05644.id, view_05644.status]
  }

  join: view_05646 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05644.user_id} = ${view_05646.id} ;;
    required_joins: []
  }

  join: view_05647 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05644.account_id} = ${view_05647.account_id} ;;
    required_joins: [view_05646]
  }

  join: view_05648 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05644.category} = ${view_05648.category} ;;
  }

  access_filter: {
    field: view_05644.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05644.is_deleted} = false ;;
}
