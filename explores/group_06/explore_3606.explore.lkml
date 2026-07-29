# Explore: explore_3606
# Auto-generated LookML Explore File

include: "/views/domain_19/view_10819.view.lkml"
include: "/views/domain_21/view_10821.view.lkml"
include: "/views/domain_22/view_10822.view.lkml"
include: "/views/domain_23/view_10823.view.lkml"

explore: explore_3606 {
  label: "Explore Explore 3606"
  description: "Comprehensive analytics explore joining base view_10819 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_10819
  
  always_filter: {
    filters: [view_10819.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10819.created_at_date: "7 days"]
    unless: [view_10819.id, view_10819.status]
  }

  join: view_10821 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10819.user_id} = ${view_10821.id} ;;
    required_joins: []
  }

  join: view_10822 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10819.account_id} = ${view_10822.account_id} ;;
    required_joins: [view_10821]
  }

  join: view_10823 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10819.category} = ${view_10823.category} ;;
  }

  access_filter: {
    field: view_10819.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10819.is_deleted} = false ;;
}
