# Explore: explore_3616
# Auto-generated LookML Explore File

include: "/views/domain_49/view_10849.view.lkml"
include: "/views/domain_01/view_10851.view.lkml"
include: "/views/domain_02/view_10852.view.lkml"
include: "/views/domain_03/view_10853.view.lkml"

explore: explore_3616 {
  label: "Explore Explore 3616"
  description: "Comprehensive analytics explore joining base view_10849 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_10849
  
  always_filter: {
    filters: [view_10849.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10849.created_at_date: "7 days"]
    unless: [view_10849.id, view_10849.status]
  }

  join: view_10851 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10849.user_id} = ${view_10851.id} ;;
    required_joins: []
  }

  join: view_10852 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10849.account_id} = ${view_10852.account_id} ;;
    required_joins: [view_10851]
  }

  join: view_10853 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10849.category} = ${view_10853.category} ;;
  }

  access_filter: {
    field: view_10849.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10849.is_deleted} = false ;;
}
