# Explore: explore_3607
# Auto-generated LookML Explore File

include: "/views/domain_22/view_10822.view.lkml"
include: "/views/domain_24/view_10824.view.lkml"
include: "/views/domain_25/view_10825.view.lkml"
include: "/views/domain_26/view_10826.view.lkml"

explore: explore_3607 {
  label: "Explore Explore 3607"
  description: "Comprehensive analytics explore joining base view_10822 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_10822
  
  always_filter: {
    filters: [view_10822.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10822.created_at_date: "7 days"]
    unless: [view_10822.id, view_10822.status]
  }

  join: view_10824 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10822.user_id} = ${view_10824.id} ;;
    required_joins: []
  }

  join: view_10825 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10822.account_id} = ${view_10825.account_id} ;;
    required_joins: [view_10824]
  }

  join: view_10826 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10822.category} = ${view_10826.category} ;;
  }

  access_filter: {
    field: view_10822.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10822.is_deleted} = false ;;
}
