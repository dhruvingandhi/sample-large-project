# Explore: explore_3581
# Auto-generated LookML Explore File

include: "/views/domain_44/view_10744.view.lkml"
include: "/views/domain_46/view_10746.view.lkml"
include: "/views/domain_47/view_10747.view.lkml"
include: "/views/domain_48/view_10748.view.lkml"

explore: explore_3581 {
  label: "Explore Explore 3581"
  description: "Comprehensive analytics explore joining base view_10744 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_10744
  
  always_filter: {
    filters: [view_10744.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10744.created_at_date: "7 days"]
    unless: [view_10744.id, view_10744.status]
  }

  join: view_10746 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10744.user_id} = ${view_10746.id} ;;
    required_joins: []
  }

  join: view_10747 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10744.account_id} = ${view_10747.account_id} ;;
    required_joins: [view_10746]
  }

  join: view_10748 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10744.category} = ${view_10748.category} ;;
  }

  access_filter: {
    field: view_10744.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10744.is_deleted} = false ;;
}
