# Explore: explore_2606
# Auto-generated LookML Explore File

include: "/views/domain_19/view_07819.view.lkml"
include: "/views/domain_21/view_07821.view.lkml"
include: "/views/domain_22/view_07822.view.lkml"
include: "/views/domain_23/view_07823.view.lkml"

explore: explore_2606 {
  label: "Explore Explore 2606"
  description: "Comprehensive analytics explore joining base view_07819 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_07819
  
  always_filter: {
    filters: [view_07819.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07819.created_at_date: "7 days"]
    unless: [view_07819.id, view_07819.status]
  }

  join: view_07821 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07819.user_id} = ${view_07821.id} ;;
    required_joins: []
  }

  join: view_07822 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07819.account_id} = ${view_07822.account_id} ;;
    required_joins: [view_07821]
  }

  join: view_07823 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07819.category} = ${view_07823.category} ;;
  }

  access_filter: {
    field: view_07819.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07819.is_deleted} = false ;;
}
